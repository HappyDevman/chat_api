json.channels do
  json.array! @channels, partial: 'channels/channel', as: :channel
end
