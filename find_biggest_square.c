/*
** EPITECH PROJECT, 2019
** BSQ : find_biggest_square.c
** File description:
** Find the largest square on a map while avoiding obstacles.
*/

#include "include/find_biggest_square.h"

int find_biggest_square_in_map(map_t *map, square *biggest_square)
{
    for (int i = 0; i < map->rows; i++) {
        for (int j = 0; j < map->cols; j++) {
            get_bsq_from_location(map, i, j, biggest_square);
        }
    }
    if (biggest_square->size == 0)
        return (84);
    return (0);
}

void get_bsq_from_location(map_t *map, int row, int col, square *biggest_sqr)
{
    while (is_square_of_size(map, row, col, biggest_sqr->size + 1))
        (biggest_sqr->size)++;
}

int is_square_of_size(map_t *map, int row, int col, int size)
{
    for ( ; row < map->rows ; row++) {
        if (!is_line_of_size(size, (map->array)[row], map->rows - row))
            return (0);
    }
    return (1);
}

int is_line_of_size(int size, char *line, int line_length)
{
    for (int i = 0; i < line_length && i < size; i++) {
        if (line[i] != '.')
            return (0);
    }
    return (1);
}