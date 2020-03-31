require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'
require 'pry'

student = Student.new('John', 'Doe')
mentor = Mentor.new('Jack', 'Gonsales')

student.sumbit_homework!('HW01', 'sorting algorithm', 'http://github...')
p student.homeworks.join(', ') # "{HW01, sorting algorithm, http://github...}"

mentor.subscribe_to!(student)
p student.notifications.join(',') # "Jack Gonsales subscribe to you "
p mentor.notifications.join(',') # Output: ""

student.sumbit_homework!('HW02', 'working with file', 'http://github...')
p mentor.notifications.join(', ') # "Student: John Doe add 'HW02' ...'"
p student.homeworks.join(', ') # "{HW01, sorting ...}, {HW02, working...}"

mentor.check_homeworks(student, 'Homework 2')
p student.notifications.join(', ') # "Jack Gonsales sub.., Homework: 'Home.."

mentor.read_notifications!
p mentor.notifications.join(', ') # Output: ""

student.read_notifications!
p student.notifications.join(', ') # Output: ""



