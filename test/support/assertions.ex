defmodule KanjiKana.Assertions do
  @moduledoc """
  Defines custom assert functions for tests.
  """

  import ExUnit.Assertions

  @doc """
  Asserts that a given URL is a local URL, and not a URL pointing to a real
  website.
  """
  def assert_local_url(url) when is_binary(url) do
    assert url =~ "http://localhost"
  end

  @doc """
  Asserts that the given URL returns the given HTTP status code.

  Also asserts that the given URL is a local URL before making the request.
  """
  def assert_http_status(url, status) when is_binary(url) do
    assert_local_url(url)

    assert {:ok, {{_version, ^status, _reason_phrase}, _headers, _body}} =
             :httpc.request(:get, {url, []}, [], [])
  end
end
