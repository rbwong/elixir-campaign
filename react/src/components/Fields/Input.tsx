import React from "react";
import styled from "@emotion/styled";

import { bgColors, fontColors } from "constants/colors";

const Container = styled.input`
  border-radius: 4px;
  background-color: ${bgColors.input};
  border-color: rgba(223, 225, 229, 0);
  box-shadow: 0 2px 8px 1px rgb(64 60 67 / 24%);
  color: ${fontColors.gray};
  font-size: 14px;
  height: 32px;
  outline-style: none;
  padding: 4px 8px;
  width: 100%;
`;

interface Prop {
  onChange: (e: React.FormEvent<HTMLInputElement>) => void;
  type: string;
  value: string;
}

function Input({ onChange, type, value }: Prop) {
  return <Container type={type} onChange={onChange} value={value} />;
}

export default Input;
