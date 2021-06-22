import React, { useState } from "react";
import styled from "@emotion/styled";
import { motion } from "framer-motion";

import { bgColors, baseColors, fontColors } from "constants/colors";

const Menu = styled.div`
  align-items: flex-start;
  display: flex;
  flex-direction: column;
  background-color: ${bgColors.dark1};
  border-radius: 3px;
  color: ${fontColors.gray};
  font-size: 16px;
  padding: 10px;
  width: 200px;
  z-index: 1000;
`;

const Item = styled.button`
  align-items: flex-start;
  display: flex;
  flex-direction: column;

  background-color: ${baseColors.opaque};
  border: none;
  border-radius: 3px;
  color: ${fontColors.white};
  cursor: pointer;
  outline: none;

  padding: 5px;
  width: 180px;
  z-index: 1000;

  &:hover {
    background-color: ${baseColors.transluscent};
  }

  &:not(:last-of-type) {
    margin-bottom: 5px;
  }
`;

interface Props {
  options: any[];
  defaultValue: any;
  onChange: (value: any) => void;
  children?: React.ReactNode;
}

export default function DropDown({
  options,
  defaultValue,
  onChange,
  children,
}: Props) {
  const [isOpen, toggleOpen] = useState(false);
  const [selected, setSelected] = useState(defaultValue);

  const subMenuAnimate = {
    enter: {
      opacity: 1,
      rotateX: 0,
      transition: {
        duration: 0.5,
      },
      display: "block",
    },
    exit: {
      opacity: 0,
      rotateX: -15,
      transition: {
        duration: 0.5,
        delay: 0.3,
      },
      transitionEnd: {
        display: "none",
      },
    },
  };

  const onSelect = (value: any) => {
    onChange(value);
    setSelected(value);
    toggleOpen(false);
  };

  return (
    <div style={{ position: "relative", width: "100%" }}>
      <motion.button
        style={{
          backgroundColor: baseColors.opaque,
          border: `1px solid ${fontColors.gray}`,
          borderRadius: "3px",
          color: fontColors.gray,
          cursor: "pointer",
          fontSize: "16px",
          outline: "none",
          padding: "10px",
          width: "160px",
          zIndex: 1000,
        }}
        variants={{
          hover: {
            backgroundColor: baseColors.transluscent,
            outline: "none",
          },
        }}
        whileTap={{ scale: 0.9 }}
        whileHover="hover"
        onClick={() => toggleOpen(!isOpen)}
        onBlur={() => toggleOpen(false)}
      >
        {children}
      </motion.button>
      <motion.div
        style={{
          position: "absolute",
          top: "42px",
          left: "0px",
          borderRadius: "3px",
          transformOrigin: "50% -50px",
        }}
        initial="exit"
        animate={isOpen ? "enter" : "exit"}
        variants={subMenuAnimate}
      >
        <Menu>
          {options.map((option) => (
            <Item
              key={`option-${option}`}
              style={{
                backgroundColor:
                  selected === option
                    ? baseColors.transluscent
                    : baseColors.opaque,
              }}
              onClick={() => onSelect(option)}
            >
              {option}
            </Item>
          ))}
        </Menu>
      </motion.div>
    </div>
  );
}
