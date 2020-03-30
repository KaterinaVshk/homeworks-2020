require_relative 'student'
require_relative 'mentor'

student = Student.new('John', 'Doe')
mentor = Mentor.new('Jack', 'Gonsales')

student.sumbit_homework!('Homework 1')
p student.homeworks             # ["Homework 1"]

mentor.subscribe_to(student)
p student.notifications         # ["Jack Gonsales subscribe to you"]
p mentor.notifications          # []

student.sumbit_homework!('Homework 2')
p mentor.notifications          # ["John Doe add Homework 2"]

mentor.check_homeworks(student, 'Homework 2')
p student.notifications         # ["Jack Gonsales sub...","Homework 2 checked"]

mentor.read_notifications!
p mentor.notifications          # []

student.read_notifications!
p student.notifications         # []
