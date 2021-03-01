require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/messages', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      content: 'text'
    }
  end

  let(:invalid_attributes) do
    {
      content: ''
    }
  end

  let(:user) { User.create(email: 'test@test.com', password: 'password') }

  describe 'GET /index' do
    before { sign_in(user, scope: :user) }

    it 'renders a successful response' do
      get messages_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before { sign_in(user, scope: :user) }

    it 'renders a successful response' do
      message = Message.create! valid_attributes.merge({ user: user })
      get message_url(message), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    before { sign_in(user, scope: :user) }

    context 'with valid parameters' do
      it 'creates a new Message' do
        expect do
          post messages_url,
               params: { message: valid_attributes }, as: :json
        end.to change(Message, :count).by(1)
      end

      it 'renders a JSON response with the new message' do
        post messages_url,
             params: { message: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Message' do
        expect do
          post messages_url,
               params: { message: invalid_attributes }, as: :json
        end.to change(Message, :count).by(0)
      end

      it 'renders a JSON response with errors for the new message' do
        post messages_url,
             params: { message: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    before { sign_in(user, scope: :user) }

    context 'with valid parameters' do
      let(:new_attributes) do
        { content: 'new content' }
      end

      it 'updates the requested message' do
        message = Message.create! valid_attributes.merge({ user: user })
        expect do
          patch message_url(message),
                params: { message: new_attributes }, as: :json
        end.to change { message.reload.content }.to('new content')
      end

      it 'renders a JSON response with the message' do
        message = Message.create! valid_attributes.merge({ user: user })
        patch message_url(message),
              params: { message: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the message' do
        message = Message.create! valid_attributes.merge({ user: user })
        patch message_url(message),
              params: { message: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    before { sign_in(user, scope: :user) }

    it 'destroys the requested message' do
      message = Message.create! valid_attributes.merge({ user: user })
      expect do
        delete message_url(message), as: :json
      end.to change(Message, :count).by(-1)
    end
  end
end
