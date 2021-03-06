# frozen_string_literal: true

module Hyrax
  module PermissionLevelsHelper
    ##
    # @return [Hash<String, String>] a map from i18nized strings to permission
    #   level keywords
    def configured_permission_levels
      Hyrax.config.permission_levels.values.each_with_object({}) do |level, hsh|
        hsh[I18n.t("hyrax.permission_levels.#{level}")] = level
      end
    end

    ##
    # @return [Hash<String, String>] a map from i18nized strings to permission
    #   level keywords
    def configured_owner_permission_levels
      Hyrax.config.owner_permission_levels.values.each_with_object({}) do |level, hsh|
        hsh[I18n.t("hyrax.permission_levels.owner.#{level}")] = level
      end
    end

    ##
    # @return [Hash<String, String>] a map from i18nized strings to permission
    #   level keywords
    def configured_permission_options
      Hyrax.config.permission_options.values.each_with_object({}) do |option, hsh|
        hsh[I18n.t("hyrax.permission_levels.options.#{option}")] = option
      end
    end
  end
end
