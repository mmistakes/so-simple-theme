module Octopress
  module Docs
    if defined?(Jekyll::Hooks)
      Jekyll::Hooks.register :site, :pre_render do |site, payload|
        if Octopress::Docs.enabled?
          Octopress::Docs.pages_info.each do |key, val|
            Octopress.site = site
            site.pages.concat Octopress::Docs.pages
            payload[key] = val
          end
        end
      end
    else
      class DocsSiteHook < Octopress::Hooks::Site
        def pre_render(site)
          if Octopress::Docs.enabled?
            Octopress.site = site
            site.pages.concat Octopress::Docs.pages
          end
        end

        def merge_payload(payload, site)
          if Octopress::Docs.enabled?
            Octopress::Docs.pages_info
          end
        end
      end
    end
  end
end

