class TaskForm
  include ActiveModel::Model

  # Main model for form
  attr_accessor :task

  # Virtual attributes for form
  attr_accessor :all_categories

  delegate :description, :description=, to: :task
  delegate :attachment, :attachment=, to: :task

  delegate :id, :persisted?, to: :task

  validate :validate_models

  def task
    @task ||= Task.new
  end

  def all_categories
    @all_categories ||= task.categories.map(&:name).join(", ")
  end

  def assign_params(params = {})
    params.each do |k,v|
      self.send("#{k}=", v)
    end
  end

  def save
    if valid?
      ActiveRecord::Base.transaction do
        task.categories = all_categories.split(",").map do |category_name|
          Category.where(name: category_name.strip).first_or_create!
        end
        task.save!
      end
    end
    task
  end

  def self.model_name
    Task.model_name
  end

  private

  def validate_models
    if task.invalid?
      task.errors.each do |attribute, message|
        errors.add(attribute, message)
      end
    end
  end

end
