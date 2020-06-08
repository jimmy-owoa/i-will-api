class List < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def self.as_list_json
    lists = self.all
    data = []
    lists.each do |list|
      data << {
        id: list.id,
        slug: list.slug,
        name: list.name,
        description: list.description,
        code: list.code,
        start_date: I18n.l(list.start_date, format: "%d-%m-%Y %H:%M"),
        end_date: I18n.l(list.end_date, format: "%d-%m-%Y %H:%M")
      }
    end

    data
  end

  def as_show_json(current_user)
    tasks = self.tasks
    
    data_tasks = []
    tasks.each do |task|
      data_tasks << {
        id: task.id,
        name: task.name,
        amount: task.amount,
        is_multiple: task.is_multiple,
        task_type_name: task.task_type.name,
        measure_unit_name: task.measure_unit.name,
        selected_task: task.user_ids.include?(current_user.id) ? true : false
      }
    end
    
    data = {
      name: self.name,
      code: self.code,
      description: self.description,
      start_date: I18n.l(self.start_date, format: "%d-%m-%Y"),
      end_date: I18n.l(self.end_date, format: "%d-%m-%Y"),
      start_time: I18n.l(self.start_date, format: "%H:%M"),
      end_time: I18n.l(self.end_date, format: "%H:%M"),
      full_start_date: self.start_date,
      full_end_date: self.end_date,
      tasks: data_tasks,
      slug: self.slug
    }

    data
  end
end