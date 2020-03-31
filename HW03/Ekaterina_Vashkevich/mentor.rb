# class describes the state and behavior of mentors and
# interaction with students
class Mentor
  attr_reader :name, :surname, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
    @students = []
  end

  def subscribe_to!(student)
    @students << student
    student.mentors << self
    subscribe_notification(student)
  end

  def check_homeworks(student, number_homework)
    student.notifications << Notification.new("'#{number_homework}' checked")
  end

  def read_notifications!
    @notifications.clear
  end

  private

  def subscribe_notification(student)
    notification = Notification.new("#{name} #{surname} subscribe to you")
    student.notifications << notification
  end
end

