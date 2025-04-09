import { useContext, useEffect } from "react";
import classes from "./styles.module.css";
import { GlobalContext } from "../../context";
import axios from "axios";
import { useNavigate, useLocation } from "react-router-dom";

export default function AddNewBlog() {
  const { formData, setFormData, isEdit, setIsEdit } =
    useContext(GlobalContext);
  const navigate = useNavigate();
  const location = useLocation();

  console.log(formData);

  async function handleSaveBlogToDB() {
    try {
      const response = isEdit
        ? await axios.put(
            `http://localhost:5000/api/blogs/update/${location.state.getCurrentBlogItem._id}`,
            {
              title: formData.title,
              description: formData.description,
            }
          )
        : await axios.post("http://localhost:5000/api/blogs/add", {
            title: formData.title,
            description: formData.description,
          });

      const result = await response.data;

      console.log(result);

      if (result) {
        setIsEdit(false); 
        setFormData({ title: "", description: "" });
        navigate("/");
      }
    } catch (error) {
      console.log(error);
    }
  }

  useEffect(() => {
    if (location.state) {
      const { getCurrentBlogItem } = location.state;
      setIsEdit(true);
      setFormData({
        title: getCurrentBlogItem.title,
        description: getCurrentBlogItem.description,
      });
    }
  }, [location]);

  return (
    <div className={classes.wrapper}>
      <h1> {isEdit ? "Edit blog" : "Add a blog"}</h1>
      <div className={classes.formWrapper}>
        <input
          name="title"
          placeholder="Enter blig title"
          id="title"
          type="text"
          value={formData.title}
          onChange={(e) =>
            setFormData({
              ...formData,
              title: e.target.value,
            })
          }
        />
        <textarea
          name="description"
          placeholder="Enter blog description"
          id="description"
          value={formData.description}
          onChange={(e) =>
            setFormData({
              ...formData,
              description: e.target.value,
            })
          }
        />
      </div>
      <button onClick={handleSaveBlogToDB}>
        {isEdit ? "Save edit" : "Add new blog"}
      </button>
    </div>
  );
}
