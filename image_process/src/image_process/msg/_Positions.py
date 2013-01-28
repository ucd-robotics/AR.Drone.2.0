"""autogenerated by genpy from image_process/Positions.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Positions(genpy.Message):
  _md5sum = "335a66deadf054ffa0c4fd8a793e884c"
  _type = "image_process/Positions"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """int16 PosX
int16 PosY

"""
  __slots__ = ['PosX','PosY']
  _slot_types = ['int16','int16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       PosX,PosY

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Positions, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.PosX is None:
        self.PosX = 0
      if self.PosY is None:
        self.PosY = 0
    else:
      self.PosX = 0
      self.PosY = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_2h.pack(_x.PosX, _x.PosY))
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.PosX, _x.PosY,) = _struct_2h.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_2h.pack(_x.PosX, _x.PosY))
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.PosX, _x.PosY,) = _struct_2h.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_2h = struct.Struct("<2h")
