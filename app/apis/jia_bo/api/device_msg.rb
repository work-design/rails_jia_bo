# frozen_string_literal: true

module JiaBo::Api
  class DeviceMsg < Base
    BASE = 'https://api.poscom.cn/apisc/'

    def info
      post 'sendMsg', origin: BASE
    end

    private
    def with_access_token(params: {}, headers: {}, payload: {})
      payload.merge!(
        reqTime: (Time.current.to_f * 1000).round.to_s,
        memberCode: @app.app.member_code,
        deviceID: @app.device_id
      )
      payload.merge! securityCode: Digest::MD5.hexdigest([payload[:memberCode], @app.device_id, payload[:msg_no], payload[:reqTime], @app.app.api_key].join)
      yield
    end

  end
end
