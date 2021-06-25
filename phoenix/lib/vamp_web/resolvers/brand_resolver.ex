defmodule VampWeb.BrandResolver do
  alias Vamp.Brand

  def all_tags(_root, _args, _info) do
    {:ok, Brand.list_tags()}
  end

  def all_campaigns(_root, _args, _info) do
    {:ok, Brand.list_campaigns()}
  end
end
