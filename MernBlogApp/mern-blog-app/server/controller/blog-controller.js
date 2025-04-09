const moongoose = require("mongoose");
const Blog = require("../model/Blog");

const fetchListOfBlogs = async (req, res) => {
  let blogList;

  try {
    blogList = await Blog.find();
  } catch (error) {
    console.log(error);
  }

  if (!blogList) {
    return res.status(404).json({ message: "No Blogs Found" });
  }

  return res.status(200).json({ blogList });
};

const addNewBlog = async (req, res) => {
  const { title, description } = req.body;
  const currentDate = new Date();

  const freshBlog = new Blog({
    title,
    description,
    date: currentDate,
  });

  try {
    freshBlog.save();
  } catch (error) {
    console.log(error);
  }

  try {
    const session = await moongoose.startSession();
    session.startTransaction();
    await freshBlog.save(session);
    session.commitTransaction();
  } catch (error) {
    return res.status(500).json({ message: error });
  }

  return res.status(200).json({ freshBlog });
};

const deleteABlog = async (req, res) => {
  const id = req.params.id;

  try {
    const findCurrentBlog = await Blog.findByIdAndDelete(id);
    if (!findCurrentBlog) {
      return res.status(404).json({ message: "Blog not found" });
    }
    return res.status(200).json({ message: "Successfully deleted" });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ message: "Unable to delete, please try again" });
  }
};

const updateABlog = async (res, req) => {
  const id = req.params.id;

  const { title, description } = req.body;
  let currenBlogToUpdate;

  try {
    currenBlogToUpdate = await Blog.findByIdAndUpdate(id, {
      title,
      description,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "failed to update" });
  }

  if (!currenBlogToUpdate) {
    return res.status(500).json({ message: "Unable to update" });
  }

  return res.status(200).json({ currenBlogToUpdate });
};

module.exports = { fetchListOfBlogs, addNewBlog, deleteABlog, updateABlog };
