# encoding: utf-8

module BitBucket
  class Users::Account < API

    # API about users/account , please refer to 
    # https://confluence.atlassian.com/display/BITBUCKET/account+Resource
    #  


    # GET the account profile
    # 
    def profile(accountname)
      response = get_request("/users/#{accountname}")
    end

    # GET the account plan
    def plan(accountname)
      response = get_request("/users/#{accountname}/plan")
    end

    # GET the emails
    def emails(accountname)
      response = get_request("/users/#{accountname}/emails")
    end

    # GET the followers
    def followers(accountname)
      response = get_request("/users/#{accountname}/followers")
    end

    # GET the events
    def events(accountname)
      response = get_request("/users/#{accountname}/events")
    end

    #GET the keys
    def keys(accountname)
      response = get_request("/users/#{accountname}/ssh-keys")
    end

    #POST a new key
    # params should be in format {key: "", label:""}
    def new_key(accountname, params)
      response = post_request("/users/#{accountname}/ssh-keys/", params)
    end

    #DELETE a key
    def delete_key(accountname, key_id)
      response = delete_request("/users/#{accountname}/ssh-keys/#{key_id}")
    end

    # GET the list of groups associated with user
    def groups(accountname, params={})
      normalize! params

      response = get_request("/groups/#{accountname}", params)
      return response unless block_given?
      response.each { |el| yield el }
    end
  end # Users::Account
end # BitBucket
