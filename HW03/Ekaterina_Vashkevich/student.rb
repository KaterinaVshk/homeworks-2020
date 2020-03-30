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

  def sumbit_homework!(homework)
    @homeworks << homework
    notify_homeworks(homework)
  end

  def notify_homeworks(homework)
    mentors.each { |mentor| mentor.notify_homeworks(self, homework) }
  end

  def subscribe(mentor)
    @mentors << mentor
    notify_subscription(mentor)
  end

  def notify_check_homework(homework)
    @notifications << "#{homework} checked "
  end

  def notify_subscription(mentor)
    @notifications << "#{mentor.name} #{mentor.surname} subscribe to you"
  end

  def read_notifications!
    @notifications.clear
  end
end
