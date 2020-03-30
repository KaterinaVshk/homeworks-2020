# class describes the state and behavior of mentors and
# interaction with students
class Mentor
  attr_reader :name, :surname, :notifications, :students

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
    @students = []
  end

  def subscribe_to(student)
    @students << student
    student.subscribe(self)
  end

  def notify_homeworks(student, homework)
    @notifications << "#{student.name} #{student.surname} add #{homework}"
  end

  def check_homeworks(student, homework)
    student.notify_check_homework(homework)
  end

  def read_notifications!
    @notifications.clear
  end
end
