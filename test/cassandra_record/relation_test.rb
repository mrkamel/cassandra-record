
require File.expand_path("../../test_helper", __FILE__)

class CassandraRecord::RelationTest < CassandraRecord::TestCase
  def test_all
    post1 = Post.create!(user: "user", domain: "domain", message: "message1")
    post2 = Post.create!(user: "user", domain: "domain", message: "message2")

    posts = Post.all.to_a

    assert_includes posts, post1
    assert_includes posts, post2
  end

  def test_where
    post1 = Post.create!(user: "user", domain: "domain1", message: "message1")
    post2 = Post.create!(user: "user", domain: "domain1", message: "message2")
    post3 = Post.create!(user: "user", domain: "domain2", message: "message1")

    posts = Post.where(user: "user").where(domain: "domain1").to_a

    assert_includes posts, post1
    assert_includes posts, post2
    refute_includes posts, post3
  end

  def test_where_with_array
    post1 = Post.create!(user: "user", domain: "domain1")
    post2 = Post.create!(user: "user", domain: "domain2")
    post3 = Post.create!(user: "user", domain: "domain3")

    posts = Post.where(user: "user").where(domain: ["domain1", "domain2"]).to_a

    assert_includes posts, post1
    assert_includes posts, post2
    refute_includes posts, post3
  end

  def test_where_with_range
    post1 = Post.create!(user: "user", domain: "domain1")
    post2 = Post.create!(user: "user", domain: "domain2")
    post3 = Post.create!(user: "user", domain: "domain3")

    posts = Post.where(user: "user").where(domain: "domain1" .. "domain2").to_a

    assert_includes posts, post1
    assert_includes posts, post2
    refute_includes posts, post3
  end

  def test_where_cql
  end

  def test_order
  end

  def test_limit
  end

  def test_first
  end

  def test_distinct
  end

  def test_select
  end

  def test_find_each
  end

  def test_find_in_batches
  end

  def test_count
  end

  def test_delete_all
  end

  def test_delete_in_batches
  end

  def test_to_a
  end
end

