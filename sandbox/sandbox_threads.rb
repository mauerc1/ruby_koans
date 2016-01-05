require 'thread'
=begin
    queue = Queue.new

    producer = Thread.new do
      5.times do |i|
        sleep rand(i) # simulate expense
        queue << i
        puts "#{i} produced"
      end
    end

    consumer = Thread.new do
      5.times do |i|
        value = queue.pop
        sleep rand(i/2) # simulate expense
        puts "consumed #{value}"
      end
    end

    consumer.join
=end

=begin
array   = []
threads = []

20.times do
  threads << Thread.new do
    15.times do
      array << 'blah'
    end
  end
end

threads.map(&:join)

puts array.size
=end


queue = Queue.new
mutex = Mutex.new
cond_var = ConditionVariable.new

queue.push(0)
#puts queue.length


pusher = Thread.new do
  count = 0
  puts Thread.current
  while count < 10
    #puts queue.length
    mutex.synchronize do
      count += 1
      #cond_var.wait(mutex)
      queue.push(count)
      #cond_var.signal

    end
  end
end


popper = Thread.new do
  puts Thread.current
  while !queue.empty?
    mutex.synchronize do
      #cond_var.wait(mutex)
      puts queue.pop
      #cond_var.signal
    end
  end
end

pusher.join
popper.join
