import React from "react";
import PropagateLoader from "react-spinners/PropagateLoader";
import { css } from "@emotion/core";
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
  loading?: boolean;
  disabled?: boolean;
  onClick: () => void;
  style?: object;
}

const Button: React.FC<Props> = ({
  color = "blue",
  children,
  disabled,
  loading,
  onClick,
  style,
}) => {
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
    <motion.button
      disabled={disabled || loading}
      onClick={onClick}
      style={{
        backgroundColor:
          loading || disabled ? baseColors.opaque : baseColors[color],
        border: "none",
        borderRadius: "3px",
        boxShadow: getBoxShadow(false),
        color: getFontColor(),
        cursor: loading || disabled ? "default" : "pointer",
        fontSize: "13px",
        outline: 0,
        padding: "10px 20px",
        textAlign: "center",
        ...style,
      }}
      whileHover={{
        backgroundColor:
          loading || disabled ? baseColors.opaque : fadeColors[color],
      }}
      whileTap={{ scale: 0.9 }}
    >
      {loading ? (
        <PropagateLoader
          css={css`
            align-items: center;
            display: flex;
            justify-content: center;
            height: 16px;
          `}
          size={15}
          color={fontColors.white}
          loading
        />
      ) : (
        children
      )}
    </motion.button>
  );
};

export default Button;
