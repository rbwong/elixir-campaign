// @ts-nocheck
import React from "react";
import styled from "@emotion/styled";

import { baseColors, fontColors } from "constants/colors";

const Container = styled.div`
  background-color: ${baseColors.purple};
  border-radius: 3px;
  color: ${fontColors.white};
  font-size: 12px;
  display: inline-block;
  margin-right: 5px;
  padding: 2px 4px;
`;

interface Prop {
  name: nameType;
}

function Hashtag({ name }: Prop) {
  return <Container>{name}</Container>;
}

export default Hashtag;
