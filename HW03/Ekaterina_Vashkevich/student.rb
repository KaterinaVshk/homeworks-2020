# class describes the state and behavior of students and
# interaction with students
class Student
  attr_reader :name, :surname, :homeworks, :mentors, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @mentors = []
    @notifications = []
  end

  def sumbit_homework!(number, description, link)
    homework = Homework.new(number, description, link)
    @homeworks << homework
    notify_homeworks(homework)
  end

  def read_notifications!
    @notifications.clear
  end

  private

  # notify mentors about adding homework
  def notify_homeworks(homework)
    mentors.each do |mentor|
      topic = "#{name} #{surname} add #{homework.number}"
      message = " #{homework.description} #{homework.link}"
      mentor.notifications << Notification.new(topic, message)
    end
  end
end
