# frozen_string_literal: true

patch = EacRailsBase0::Patches::EacRailsUtilsLinksHelper
target = EacRailsUtils::LinksHelper
target.prepend(patch) unless target.include?(patch)

patch = EacRailsBase0::Patches::UrlFor
target = ActionDispatch::Routing::UrlFor
target.prepend(patch) unless target.include?(patch)
