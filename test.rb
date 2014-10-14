require_relative 'monty_hall'

SAMPLES_COUNT = Integer(ARGV[0])
DOOR_COUNT    = Integer(ARGV[1])

p SAMPLES_COUNT
    .times
    .collect   { MONTY_HALL.(DOOR_COUNT).(rand(DOOR_COUNT)).(true) }
    .partition { |result| result }
    .map(&:size)
