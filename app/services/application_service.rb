class ApplicationService
  attr_reader :params

  def self.call(params = {})
    new(params).call
  end

  def initialize(params = {})
    @params = params.is_a?(String) ? JSON.parse(params, symbolize_names: true) : params
  end

  def call
    raise NotImplementedError, "#{self.class} must implement #call"
  end

  private

  def transaction(&)
    ActiveRecord::Base.transaction(&)
  end

  def log_event(user:, data: {})
    event_data = { user:, data:, class_name: self.class.to_s }.compact
    AuditLog.create(event_data)
  end

  Result = Struct.new(:success, :data, :errors, keyword_init: true) do
    alias_method :success?, :success
  end

  def success(data = {})
    Result.new(success: true, data:, errors: nil)
  end

  def failure(errors)
    Result.new(success: false, data: nil, errors:)
  end
end
