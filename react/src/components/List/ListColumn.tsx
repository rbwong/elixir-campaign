// @ts-nocheck
import React from "react";
import styled from "@emotion/styled";

interface Prop {
  flexSize: string;
  children: any;
}

function ListColumn({ flexSize, children }: Prop) {
  const Container = styled.div`
    flex: ${flexSize};
  `;

  return <Container>{children}</Container>;
}

export default ListColumn;
