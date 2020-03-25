# writes lines from file to array
logs = File.readlines('data_t_02.txt')
IP = /\d+.\d+\.\d+\.\d+/.freeze
DATA = /\[\d{2}\/\w+\/\d{4}\:\d{2}\:\d{2}\:\d{2} \+\d{4}\]/.freeze
PATH = /\/\w+\/\w+\/\w+/.freeze
REGEX_POST = /#{IP} - - #{DATA} "POST #{PATH}/.freeze
#REGEX_POST = /#{IP}#{DATA} "POST #{PATH} HTTP/.freeze

# formated line from log, that match REGEX_POST
def formated_log(log)
  log.select { |line| line.match(REGEX_POST) }.map do |line|
    "#{line[DATA]} FROM: #{line[IP]} TO: #{line[PATH].upcase}"
  end
end

puts formated_log(logs)
