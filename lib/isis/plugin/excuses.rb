require 'nokogiri'

module Isis
  module Plugin
    class Excuses < Isis::Plugin::Base
      TRIGGERS = %w(!excuse !excuses)

      def respond_to_msg?(msg, speaker)
        @commands = msg.downcase.split
        TRIGGERS.include? @commands[0]
      end

      private

      def response_text
        developer_excuses
      end

      def developer_excuses
        page = Nokogiri.HTML(open('http://www.developerexcuses.com'))
        page.css('a').first.text.strip
      end
    end
  end
end
