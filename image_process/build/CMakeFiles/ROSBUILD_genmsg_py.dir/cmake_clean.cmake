FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/image_process/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/image_process/msg/__init__.py"
  "../src/image_process/msg/_faceInfo.py"
  "../src/image_process/msg/_Positions.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
