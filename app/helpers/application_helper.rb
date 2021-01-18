# frozen_string_literal: true

module ApplicationHelper
  def decorate(model, decorator_class = nil)
    (decorator_class || "#{model.class}Decorator".constantize).new(model)
  end
end
