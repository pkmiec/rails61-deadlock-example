require "test_helper"

class PrimaryModelTest < ActiveSupport::TestCase
  test 'deadlock' do
    puts "Test Thread: #{Thread.current.name}"
    puts "PrimaryModel.connection_pool.object_id: #{PrimaryModel.connection_pool.object_id}"
    puts "PrimaryModel.connection_pool.send(:current_thread): #{PrimaryModel.connection_pool.send(:current_thread)}"
    puts "PrimaryModel.connection.object_id: #{PrimaryModel.connection.object_id}"
    puts "PrimaryModel.connection.query_cache_enabled: #{PrimaryModel.connection.query_cache_enabled}"
    puts "OtherModel.connection_pool.object_id: #{OtherModel.connection_pool.object_id}"
    puts "OtherModel.connection_pool.send(:current_thread): #{OtherModel.connection_pool.send(:current_thread)}"
    puts "OtherModel.connection.object_id: #{OtherModel.connection.object_id}"
    puts "OtherModel.connection.query_cache_enabled: #{OtherModel.connection.query_cache_enabled}"

    thread1 = Thread.new('thead1') do
      puts "Thread1: #{Thread.current.name}"
      puts "Thread1: PrimaryModel.connection_pool.object_id: #{PrimaryModel.connection_pool.object_id}"
      puts "Thread1: PrimaryModel.connection_pool.send(:current_thread): #{PrimaryModel.connection_pool.send(:current_thread)}"
      puts "Thread1: PrimaryModel.connection.object_id: #{PrimaryModel.connection.object_id}"
      puts "Thread1: PrimaryModel.connection.query_cache_enabled: #{PrimaryModel.connection.query_cache_enabled}"
      puts "Thread1: OtherModel.connection_pool.object_id: #{OtherModel.connection_pool.object_id}"
      puts "Thread1: OtherModel.connection_pool.send(:current_thread): #{OtherModel.connection_pool.send(:current_thread)}"
      puts "Thread1: OtherModel.connection.object_id: #{OtherModel.connection.object_id}"
      puts "Thread1: OtherModel.connection.query_cache_enabled: #{OtherModel.connection.query_cache_enabled}"
      loop do
        PrimaryModel.transaction do
          OtherModel.transaction do
            OtherModel.create!(name: 'other')
            sleep 0.5
          end
          sleep 0.5
        end
        puts 'thread1'
      end
    end

    thread2 = Thread.new('thread2') do
      puts "Thread2: #{Thread.current.name}"
      puts "Thread2: PrimaryModel.connection_pool.object_id: #{PrimaryModel.connection_pool.object_id}"
      puts "Thread2: PrimaryModel.connection_pool.send(:current_thread): #{PrimaryModel.connection_pool.send(:current_thread)}"
      puts "Thread2: PrimaryModel.connection.object_id: #{PrimaryModel.connection.object_id}"
      puts "Thread2: PrimaryModel.connection.query_cache_enabled: #{PrimaryModel.connection.query_cache_enabled}"
      puts "Thread2: OtherModel.connection_pool.object_id: #{OtherModel.connection_pool.object_id}"
      puts "Thread2: OtherModel.connection_pool.send(:current_thread): #{OtherModel.connection_pool.send(:current_thread)}"
      puts "Thread2: OtherModel.connection.object_id: #{OtherModel.connection.object_id}"
      puts "Thread2: OtherModel.connection.query_cache_enabled: #{OtherModel.connection.query_cache_enabled}"

      loop do
        OtherModel.transaction do
          PrimaryModel.transaction do
            PrimaryModel.create!(name: 'primary')
            sleep 0.5
          end
          sleep 0.5
        end
        puts 'thread2'
      end
    end

    thread1.join
    thread2.join
  end
end
