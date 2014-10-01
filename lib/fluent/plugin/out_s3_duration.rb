module Fluentd
  require 'fluent/plugin/out_s3'

  class S3DurationOutput < Fluent::S3Output
    Fluent::Plugin.register_output('s3_duration', self)

    config_param :time_slice_duration, :integer, :default => 0

    def filter_duration(time)
      if @time_slice_duration != 0
        Time.at((time.to_i / @time_slice_duration).to_i * @time_slice_duration)
      else
        time
      end
    end

    def configure(conf)
      super
      @time_slice_duration = conf['time_slice_duration'].to_i
      if @localtime
         @time_slicer = Proc.new {|time|
           filter_duration(Time.at(time)).strftime(@time_slice_format)
         }
      else
         @time_slicer = Proc.new {|time|
           filter_duration(Time.at(time)).utc.strftime(@time_slice_format)
         }
      end
    end
  end
end
