// @ts-nocheck
import React from "react";
import styled from "@emotion/styled";

import { bgColors } from "constants/colors";

const Container = styled.div`
  background-color: ${bgColors.white};
  border-radius: 5px;
  box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
  display: flex;
  padding: 15px;
  width: 100%;
`;

interface Prop {
  children: any;
}

function ListItem({ children }: Prop) {
  return <Container>{children}</Container>;
}

export default ListItem;
