import React from "react";
import { motion } from "framer-motion";

import { baseColors, fontColors, fadeColors } from "constants/colors";

interface Props {
  color?:
    | "red"
    | "blue"
    | "gray"
    | "opaque"
    | "transparent"
    | "gold"
    | "dark"
    | "purple";
  children: any;
  style?: object;
  url: string;
}

const Link: React.FC<Props> = ({ color = "blue", url, children, style }) => {
  const getFontColor = () => {
    if (color === "gray") {
      return fontColors.gray;
    }

    return fontColors.white;
  };

  const getBoxShadow = (hover: boolean) => {
    if (color === "gray" || color === "transparent") {
      return "none";
    } else if (hover) {
      return "0 10px 25px rgba(0, 0, 0, 0.35)";
    }

    return "0 5px 30px rgba(0, 0, 0, 0.3)";
  };

  return (
    <motion.a
      href={url}
      style={{
        backgroundColor: baseColors[color],
        border: "none",
        borderRadius: "3px",
        boxShadow: getBoxShadow(false),
        color: getFontColor(),
        cursor: "pointer",
        fontSize: "13px",
        outline: 0,
        padding: "10px 20px",
        textAlign: "center",
        textDecoration: "none",
        ...style,
      }}
      whileHover={{
        backgroundColor: fadeColors[color],
      }}
      whileTap={{ scale: 0.9 }}
    >
      {children}
    </motion.a>
  );
};

export default Link;
