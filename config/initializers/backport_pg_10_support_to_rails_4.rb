# frozen_string_literal: true
require 'active_record/connection_adapters/postgresql/schema_statements'

#
# Monkey-patch the refused Rails 4.2 patch at https://github.com/rails/rails/pull/31330
#
# Updates sequence logic to support PostgreSQL 10.
#

module ActiveRecord
  module ConnectionAdapters
    module PostgreSQL
      module SchemaStatements
        # Resets the sequence of a table's primary key to the maximum value.
        def reset_pk_sequence!(table, pk = nil, sequence = nil) #:nodoc:
          unless pk && sequence
            default_pk, default_sequence = pk_and_sequence_for(table)
            pk ||= default_pk
            sequence ||= default_sequence
          end
          reset_pk_sequence_log(sequence, table, pk)
          return unless pk && sequence
          reset_pk_sequence_select_value(sequence, table, pk)
        end

        private

        def reset_pk_sequence_max_pk(table, pk)
          select_value("SELECT MAX(#{quote_column_name pk}) FROM #{quote_table_name(table)}")
        end

        def reset_pk_sequence_minvalue(max_pk, quoted_sequence)
          return nil unless max_pk.nil?
          if postgresql_version >= 100_000
            select_value('SELECT seqmin FROM pg_sequence WHERE seqrelid = ' \
                "#{quote(quoted_sequence)}::regclass")
          else
            select_value("SELECT min_value FROM #{quoted_sequence}")
          end
        end

        def reset_pk_sequence_log(sequence, table, pk)
          if @logger && pk && !sequence
            @logger.warn "#{table} has primary key #{pk} with no default sequence"
          end
        end

        def reset_pk_sequence_select_value(sequence, table, pk)
          quoted_sequence = quote_table_name(sequence)
          max_pk = reset_pk_sequence_max_pk(table, pk)
          minvalue = reset_pk_sequence_minvalue(max_pk, quoted_sequence)
          select_value <<-end_sql, 'SCHEMA'
              SELECT setval(#{quote(quoted_sequence)}, #{max_pk ? max_pk : minvalue}, #{max_pk ? true : false})
          end_sql
        end
      end
    end
  end
end
