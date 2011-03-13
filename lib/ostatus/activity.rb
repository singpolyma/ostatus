module OStatus

  # This class represents an Activity object for an OStatus entry.
  class Activity

    # This will create an instance of an Activity class populated
    # with the given XML data.
    def initialize(activity_root)
      @activity = activity_root
    end

    def pick_first_node(a)
      if a.empty?
        nil
      else
        a[0].content
      end
    end
    private :pick_first_node

    # Returns the object field or nil if it does not exist.
    def object
      pick_first_node(@activity.xpath('./activity:object'))
    end

    # Returns the target field or nil if it does not exist.
    def target
      pick_first_node(@activity.xpath('./activity:target'))
    end

    # Returns the verb field or nil if it does not exist.
    def verb
      pick_first_node(@activity.xpath('./activity:verb'))
    end

    # Returns the object-type field or nil if it does not exist.
    def object_type
      pick_first_node(@activity.xpath('./activity:object-type'))
    end

    # Returns a hash of all relevant fields.
    def info
      {
        :object => self.object,
        :target => self.target,
        :verb => self.verb,
        :object_type => self.object_type
      }
    end
  end
end