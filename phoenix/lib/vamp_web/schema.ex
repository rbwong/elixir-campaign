defmodule VampWeb.Schema do
  use Absinthe.Schema

  alias VampWeb.PeopleResolver
  alias VampWeb.BrandResolver

  import_types Absinthe.Type.Custom

  object :team do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :code, non_null(:string)
    field :color_set, non_null(:string)
  end

  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :phone, non_null(:string)
    field :teams, list_of(:team)
  end

  object :jwt do
    field :token, non_null(:string)
  end

  object :tag do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  object :campaign do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :budget, non_null(:decimal)
    field :start_date, non_null(:datetime)
    field :end_date, non_null(:datetime)
    field :descsription, non_null(:string)
    field :tags, list_of(:tag)
    field :team, :team
  end

  query do
    @desc "Get all teams"
    field :all_teams, non_null(list_of(non_null(:team))) do
      resolve(&PeopleResolver.all_teams/3)
    end

    @desc "Get all users"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&PeopleResolver.all_users/3)
    end

    @desc "Get all tags"
    field :all_tags, non_null(list_of(non_null(:tag))) do
      resolve(&BrandResolver.all_tags/3)
    end

    @desc "Get all campaigns"
    field :all_campaigns, non_null(list_of(non_null(:campaign))) do
      resolve(&BrandResolver.all_campaigns/3)
    end
  end

  mutation do
    @desc "Login/Generate JWT for user"
    field :login_user, :jwt do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &PeopleResolver.login_user/3
    end

    @desc "Assigns a team to a user"
    field :assign_user_team, :user do
      arg :user_id, non_null(:id)
      arg :team_id, non_null(:id)

      resolve &PeopleResolver.assign_user_team/3
    end

    @desc "Assigns a team to a campaign"
    field :assign_campaign_team, :user do
      arg :user_id, non_null(:id)
      arg :campaign_id, non_null(:id)

      resolve &BrandResolver.assign_campaign_team/3
    end
  end
end
