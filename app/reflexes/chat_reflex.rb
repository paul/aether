# frozen_string_literal: true

class ChatReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances include CableReady::Broadcaster and expose the following properties:
  #
  #   - connection  - the ActionCable connection
  #   - channel     - the ActionCable channel
  #   - request     - an ActionDispatch::Request proxy for the socket connection
  #   - session     - the ActionDispatch::Session store for the current visitor
  #   - flash       - the ActionDispatch::Flash::FlashHash for the current request
  #   - url         - the URL of the page that triggered the reflex
  #   - params      - parameters from the element's closest form (if any)
  #   - element     - a Hash like object that represents the HTML element that triggered the reflex
  #     - signed    - use a signed Global ID to map dataset attribute to a model eg. element.signed[:foo]
  #     - unsigned  - use an unsigned Global ID to map dataset attribute to a model  eg. element.unsigned[:foo]
  #   - cable_ready - a special cable_ready that can broadcast to the current visitor (no brackets needed)
  #   - reflex_id   - a UUIDv4 that uniquely identies each Reflex
  #
  # Example:
  #
  #   before_reflex do
  #     # throw :abort # this will prevent the Reflex from continuing
  #     # learn more about callbacks at https://docs.stimulusreflex.com/lifecycle
  #   end
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com/reflexes#reflex-classes

  def next
    index = params[:next] || 0
    
    messages = SURVEY[0..index]

    html = render(partial: "message", collection: messages, locals: {next: index + 1})

    # morph "#conversation", html
    cable_ready.append(
      selector: "#conversation",
      html: html
    )

    cable_ready.console_log(message: "Cable Ready rocks!").broadcast

    morph :nothing
  end

  SURVEY = [
    {text: "Hi John, I have a few more questions about your profile."},
    {text: "Is 720-555-1234 your current phone number?"},
    {select: ["Yes", "No"]},
    {text: "What is your current phone number?"},
    {input: :phone_number},
    {text: "Great! What types of jobs are you interested in?"},
    {select: ["Accounting", "Data", "Design", "Education", "Engineering", "IT", "Product Management", "Technology"]},
    {text: "Thanks!"},
  ]
end
