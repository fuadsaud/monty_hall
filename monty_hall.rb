MONTY_HALL = ->(door_count) {
  ->(pick_idx) {
    doors = [false] * door_count

    prize_idx = rand(door_count)

    doors[prize_idx] = true

    candidate_idx =
      if pick_idx == prize_idx
        loop do
          if (i = rand(door_count)) != pick_idx
            break i
          end
        end
      else
        prize_idx
      end

    ->(switch) {
      open_door = if switch
                    candidate_idx
                  else
                    pick_idx
                  end

      print "PRIZE: %2d " % prize_idx
      print "PICK:  %2d " % pick_idx
      print "CANDIDATE: %2d " % candidate_idx
      puts  "OPEN: %2d" % open_door

      open_door == prize_idx
    }
  }
}
