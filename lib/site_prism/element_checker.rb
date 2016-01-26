module SitePrism
  module ElementChecker
    def all_there?
      wait_time = SitePrism.use_implicit_waits ? Waiter.default_wait_time : 0
      Capybara.using_wait_time(wait_time) do
        self.class.mapped_items.all? { |element| send "has_#{element}?" }
      end
    end
  end
end
