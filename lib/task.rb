class Task

  attr_reader(:description)

  def initialize(attributes)
    @description = attributes.fetch(:description)
  end

  def self.all
    returned_tasks = DB.exec("SELECT * FROM taks;")
    tasks = []
    returned_tasks.each do |task|
      description = task.fetch("description")
      tasks.push(Task.new({:description => description}))
    end
    tasks
  end

  def ==(another_task)
    self.description().==(another_task.description())
  end

end
