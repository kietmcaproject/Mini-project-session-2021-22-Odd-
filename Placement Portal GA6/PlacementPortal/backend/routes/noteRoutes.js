import express from "express";
import {
  getNoteById,
  getNotes,
  CreateNote,
  DeleteNote,
  UpdateNote,
} from "../controllers/noteController.js";
const router = express.Router();

router.route("/").get(getNotes);
router.route("/:id").get(getNoteById).delete(DeleteNote).put(UpdateNote);
router.route("/create").post(CreateNote);

export default router;
