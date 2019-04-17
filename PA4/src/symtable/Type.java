package symtable;

import exceptions.*;

import java.util.*;

public class Type
{
  public static final Type BOOL = new Type();
  public static final Type INT = new Type();
  public static final Type BYTE = new Type();
  public static final Type COLOR = new Type();
  public static final Type BUTTON = new Type();
  public static final Type VOID = new Type();
  public static final Type TONE = new Type();


  private String typeName;
  private static Map<String, Type> typeMap = new HashMap<>();
  private Type()
  {
      typeName = null;
  }

  public Type(String name) {
    typeName = "class_"+name;
    typeMap.put(name, this);
  }

  public static Type getOrCreateType(String name) {
    if (typeMap.containsKey(name)) {
      return typeMap.get(name);
    }
    else {
      Type newtype = new Type(name);
      //typeMap.put(name, newtype);
      return newtype;
    }
  } 


    
/*
*/

  public String toString()
  {
    if(this == INT)
    {
      return "INT";
    }

    if(this == BOOL)
    {
      return "BOOL";
    }

    if(this == BYTE)
    {
      return "BYTE";
    }

    if(this == COLOR)
    {
      return "COLOR";
    }

    if(this == BUTTON)
    {
      return "BUTTON";
    }

    if (this == TONE) {
      return "TONE";
    }

    if (this == VOID) {
      return "class_null";
    }

    if (typeName != null) {
      return typeName;
    }

    
/*
*/
    return "MAINCLASS;";
  }
  
  public int getAVRTypeSize() {
      if(this == INT) { return 2; }
      if(this == BOOL) { return 1; }
      if(this == BYTE) { return 1; }
      if(this == COLOR) { return 1; }
      if(this == BUTTON) { return 1; }
      if(this == VOID) { return 0; }

      return 2; // class references are 2 bytes
  }

    
/*  
*/

}
