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

  def next(index = 0)
    logger.debug(index: index)
    message = SURVEY[index]

    html = render(partial: "message", locals: {message: message})

    # morph "#conversation", html
    cable_ready.append(
      selector: "#conversation",
      html: html
    )
    .set_dataset_property(
      selector: "#conversation",
      name: "chatIndexValue",
      value: index + 1
    )
    morph :nothing
  end

  SURVEY = [
    {text: "Hi John, I have a few more questions about your profile."},
    {text: "Is 720-555-1234 your current phone number?",
     select: ["Yes", "No"]},
    {text: "What is your current phone number?",
     input: :phone_number},
    {text: "Great! What types of jobs are you interested in?",
     select: ["Accounting", "Data", "Design", "Education", "Engineering", "IT", "Product Management", "Technology"]},
    {text: "Thanks!"},
  ]
end
