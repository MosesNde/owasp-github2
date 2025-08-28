     include History::Addon::Backup
 
     default_scope ->{ where(route: "member/login") }

    def redirect_full_url
      return if redirect_url.blank?

      ret = make_full_url(redirect_url)
      return if ret.blank?
      return unless trusted?(ret)

      ret.to_s
    end

    def make_trusted_full_url(ref)
      return if ref.blank?

      full_url = make_full_url(URI::decode(ref))
      return if full_url.blank?

      # normalize full url
      full_url.fragment = nil
      full_url.query = nil

      # trusted?
      return unless trusted?(full_url)

      full_url.to_s
    end

    private

    def make_full_url(path)
      site_root_url = URI.parse(site.full_root_url)
      URI.join(site_root_url, path) rescue nil
    end

    def trusted?(full_url)
      return false if full_url.blank?

      %w(http https).include?(full_url.scheme) && full_url.to_s.start_with?(site.full_url)
    end
   end
 
   class Mypage