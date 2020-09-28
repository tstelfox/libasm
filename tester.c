/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   tester.c                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: tmullan <tmullan@student.codam.nl>           +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/09/18 16:15:46 by tmullan       #+#    #+#                 */
/*   Updated: 2020/09/28 18:09:43 by tmullan       ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include "libasm.h"

int		main(int argc, char *argv[])
{
	if (argc != 2)
		exit(0);
	char	dst[ft_strlen(argv[1])];
	int		fd = open("nope", O_RDONLY);
	
	printf("\t\t*-*-*-*-*-STRLEN-*-*-*-*-*\n\n");
	printf("ASM strlen %lu\n", ft_strlen(argv[1]));
	printf("OG strlen %lu\n", strlen(argv[1]));

	printf("\n\t\t*-*-*-*-*-STRCPY-*-*-*-*-*\n\n");
	printf("ASM function: %s\n", ft_strcpy(dst, argv[1]));
	printf("OG function: %s\n", strcpy(dst, argv[1]));

	printf("\n\t\t*-*-*-*-*-STRCMP-*-*-*-*-*\n\t\tcompared to 'bigyeet'\n\n");
	printf("ASM function: %d\n", ft_strcmp("bigyeet", argv[1]));
	printf("OG function: %d\n", strcmp("bigyeet", argv[1]));
	
	printf("\n\t\t*-*-*-*-*-WRITE-*-*-*-*-*\n\t\tinaccessible file 'nope'\n\n");
	printf("ASM FD way off %zd\n", ft_write(fd, "Fucking", 7));
	printf("ASM errno is %d\n", errno);
	printf("OG FD way off %zd\n", write(fd, "Fucking", 7));
	printf("OG errno is %d\n", errno);

	printf("\n\t\t*-*-*-*-*-READ-*-*-*-*-*\n\t\tinaccessible file 'nope'\n\n");
	printf("ASM READ FD way off %zd\n", ft_read(fd, dst, 1));
	printf("ASM READ errno is %d\n", errno);
	printf("OG READ FD way off %zd\n", read(fd, dst, 1));
	printf("OG READ errno is %d\n", errno);

	printf("\n\t\t*-*-*-*-*-STRDUP-*-*-*-*-*\n\n");
	printf("ASM strdup: %s\n", ft_strdup(argv[1]));
	printf("OG strdup: %s\n", strdup(argv[1]));
	return (0);
}
