require "droplet_kit"

module Ci::Killer
  class DigitalOcean
    attr_reader :time_in_minutes

    def self.kill(time_in_minutes)
      new(time_in_minutes).kill
    end

    def initialize(time_in_minutes)
      @time_in_minutes = time_in_minutes.to_i
    end

    def kill
      droplets_to_kill.each do |droplet|
        running_time = ((Time.now.utc - DateTime.parse(droplet.created_at).utc) / 60).round
        print "* Droplet #{droplet.name} (#{droplet.id}) has been running for #{running_time} minute(s)."
        client.droplets.delete(id: droplet.id)
        puts " [KILLED]"
      end
    end

  private

    def droplets_to_kill
      maximum_age = Time.now.utc - (60 * time_in_minutes)

      client.droplets.all.select do |droplet|
        DateTime.parse(droplet.created_at).utc < maximum_age
      end
    end

    def client
      @client ||= DropletKit::Client.new(access_token: ENV['DIGITAL_OCEAN_ACCESS_TOKEN'])
    end
  end
end
