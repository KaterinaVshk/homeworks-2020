require 'time'

# writes lines from file to array
log = File.readlines('data_t_03.txt')

REGEX_TIME = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}.\d{1}/.freeze

# function that parsing time
def time_parse(line)
   Time.parse(line[REGEX_TIME])
end


def duration_of_action(logs)

    string_action = logs.select {|line| line.include? ('Calling core')}
    
    return 0 if string_action.size < 2 
   
    #finds duration betwenn 1st and 2nd event, 2nd and 3rd etc.
    rezult = string_action.map.with_index {|line, index|
      if index < string_action.size - 1
        
        #start event time
        start = time_parse(line) 

        #event time
        finish = time_parse(string_action[index+1])
        (finish - start).to_s 
      end
    }
    rezult.delete_at(rezult.size - 1)
    rezult
end

 p duration_of_action(log)

 #output : ["49.1", "35.0"]