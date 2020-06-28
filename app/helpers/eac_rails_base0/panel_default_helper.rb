# frozen_string_literal: true

module EacRailsBase0
  module PanelDefaultHelper
    def panel_default(title, &block)
      content_tag(:div, class: 'container') do
        content_tag(:div, class: 'panel panel-default') do
          panel_heading(title) << panel_body(block)
        end
      end
    end

    private

    def panel_heading(title)
      content_tag(:div, class: 'panel-heading') do
        content_tag(:h2, class: 'panel-title') do
          title
        end
      end
    end

    def panel_body(block)
      content_tag(:div, class: 'panel-body') do
        block ? block.call : ''
      end
    end
  end
end
