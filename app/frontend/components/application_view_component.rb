class ApplicationViewComponent < ViewComponentContrib::Base
  include ApplicationHelper

  class << self
    def component_name
      @component_name ||= name.sub(/::Component$/, "").underscore
    end

    def identifier
      @identifier ||= component_name.gsub("_", "-").gsub("/", "--")
    end
  end

  def class_for(name)
    "c--#{self.class.identifier}--#{name}"
  end

  def controller_name
    self.class.identifier
  end
end
