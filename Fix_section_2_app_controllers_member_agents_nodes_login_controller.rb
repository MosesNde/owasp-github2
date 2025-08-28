       remote_addr: remote_addr,
       user_agent: request.user_agent)
 
    ref = @cur_node.make_trusted_full_url(params[:ref] || flash[:ref])
    ref = @cur_node.redirect_full_url if ref.blank?
    ref = @cur_site.full_url if ref.blank?
     flash.discard(:ref)
 
     redirect_to ref
   end
 
  def make_url_if_trusted(ref)
    return if ref.blank?

    ref = URI::decode(ref)

    site_url = URI.parse(@cur_site.full_url)
    full_url = URI.join(site_url, ref) rescue nil
    return if full_url.blank?
    return unless %w(http https).include?(full_url.scheme)

    # normalize full url
    full_url.fragment = nil
    full_url.query = nil

    # trusted?
    return if full_url.scheme != site_url.scheme
    return if full_url.host != site_url.host
    return if full_url.port != site_url.port

    full_url.to_s
  end

   public
 
   def login