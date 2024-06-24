# frozen_string_literal: true

require 'delayed_job_active_record'

module EacRailsBase0
  module AppBase
    class AbilityMapping
      include CanCanDry::AbilityMapping
      include CanCanDry::AbilityMappingSets::ActiveScaffold
      include CanCanDry::AbilityMappingSets::Devise
      include CanCanDry::AbilityMappingSets::DeviseInvitable

      MAP_METHODS = %w[aranha devise devise_invitable eac_rails_base0
                       eac_rails_delayed_job eac_rails_remotes eac_users_support tasks_schedulers]
                      .freeze

      def initialize
        MAP_METHODS.each { |m| send("map_#{m}") }
      end

      def map_eac_rails_delayed_job
        map_controller 'EacRailsDelayedJob::DelayedJobs', :manage, ::Delayed::Job
      end

      def map_eac_rails_remotes
        map_controller 'EacRailsRemotes::Instances', :manage, ::EacRailsRemotes::Instance
      end

      def map_eac_rails_base0
        map_controller 'EacRailsBase0::Mailer', :manage, :eac_rails_base0_mailer
      end

      def map_eac_users_support
        map_controller 'EacUsersSupport::Admin::Users', :manage, ::EacUsersSupport::User
      end

      def map_aranha
        map_controller 'Aranha::Addresses', :manage, ::Aranha::Address
        map_controller 'Aranha::ProcessorConfigurations', :manage, ::Aranha::ProcessorConfiguration
        map_controller 'Aranha::StartPoints', :manage, ::Aranha::StartPoint
      end

      def map_tasks_schedulers
        map_controller 'ScheduledTasks', :manage, ::ScheduledTask
        map_controller 'ScheduledTaskStatuses', :manage, ::ScheduledTask
        map_controller 'TasksSchedulerDaemon', :manage, ::ScheduledTask
      end
    end
  end
end
