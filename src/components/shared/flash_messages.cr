class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |flash_type, flash_message|
      flash_type_class = (
        case flash_type
        when "success"
          "text-green-400"
        when "failure"
          "text-red-400"
        when "info"
          "text-blue-400"
        else
          ""
        end
      )

      div class: "#{flash_type_class} font-bold p-4 flex flex-row justify-center items-center sm:justify-start".strip do
        text flash_message
      end
    end
  end
end
